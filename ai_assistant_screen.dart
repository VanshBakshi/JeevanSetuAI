import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AIAssistantScreen extends StatefulWidget {
  const AIAssistantScreen({super.key});

  @override
  State<AIAssistantScreen> createState() => _AIAssistantScreenState();
}

class _AIAssistantScreenState extends State<AIAssistantScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<_ChatMessage> _messages = [
    _ChatMessage(
      text:
          'Hello! I am JeevanSetu AI. Ask me about flood safety, shelters, rescue support, or emergency actions.',
      isUser: false,
    ),
  ];

  bool _isTyping = false;

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(_ChatMessage(text: text, isUser: true));
      _isTyping = true;
    });

    _controller.clear();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add(
          _ChatMessage(text: _generateResponse(text), isUser: false),
        );
        _isTyping = false;
      });
    });
  }

  String _generateResponse(String input) {
    final q = input.toLowerCase();

    if (q.contains('shelter')) {
      return 'The nearest shelter is Govt School Ward 5, approximately 1.2 km away. Follow the highlighted safe route in the map section.';
    } else if (q.contains('safe')) {
      return 'Move to higher ground, avoid flooded roads, switch off electricity if water enters your house, and keep emergency documents waterproof.';
    } else if (q.contains('rescue')) {
      return 'Rescue Team RT-03 is active in your zone. Estimated arrival time is about 18 minutes.';
    } else if (q.contains('water')) {
      return 'Current reported water level near your location is 4.2 ft and rising. Avoid entering flowing water.';
    } else if (q.contains('food')) {
      return 'Relief food distribution is available at Community Hall Sector 3 from 8:00 AM to 6:00 PM.';
    }

    return 'I have recorded your query. Based on current flood conditions, please stay alert and follow official emergency advisories.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.smart_toy, color: Colors.white, size: 20),
            ),
            SizedBox(width: 10),
            Text(
              'JeevanSetu AI',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          // Quick prompts
          SizedBox(
            height: 54,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              children: [
                _quickChip('Nearest shelter'),
                _quickChip('Am I safe?'),
                _quickChip('Need rescue'),
                _quickChip('Water level'),
                _quickChip('Food relief'),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Chat messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(18),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (_isTyping && index == _messages.length) {
                  return const _TypingBubble();
                }

                final message = _messages[index];

                return Align(
                  alignment: message.isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 290),
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: message.isUser ? AppColors.primary : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(
                        color: message.isUser
                            ? Colors.white
                            : AppColors.textPrimary,
                        height: 1.4,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Input area
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Ask about flood safety...',
                        filled: true,
                        fillColor: AppColors.background,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      onSubmitted: _sendMessage,
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: AppColors.primary,
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () => _sendMessage(_controller.text),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickChip(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ActionChip(
        label: Text(text),
        backgroundColor: Colors.white,
        onPressed: () => _sendMessage(text),
      ),
    );
  }
}

// =====================================================
// MODELS
// =====================================================

class _ChatMessage {
  final String text;
  final bool isUser;

  _ChatMessage({required this.text, required this.isUser});
}

// =====================================================
// TYPING INDICATOR
// =====================================================

class _TypingBubble extends StatelessWidget {
  const _TypingBubble();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _Dot(),
            SizedBox(width: 4),
            _Dot(),
            SizedBox(width: 4),
            _Dot(),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: AppColors.textSecondary,
        shape: BoxShape.circle,
      ),
    );
  }
}
