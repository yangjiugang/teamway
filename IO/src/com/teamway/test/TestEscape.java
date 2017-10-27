package com.teamway.test;

public class TestEscape {

	public static void main(String[] args) {

	}
	/**
	public String escape(String line)
    {
        int len = line.length();
        StringBuilder buffer = new StringBuilder(len * 2);

        for (int i = 0; i < len; i++)
        {
            char c = line.charAt(i);
            int idx = ESCAPEABLE_CHARS.indexOf(c);

            if (idx >= 0)
            {
                buffer.append(ESCAPE_CHAR);
                buffer.append(ESCAPE_LETTERS.charAt(idx));
            }
            else
            {
                if ((c < ASCII_MIN) || (c > ASCII_MAX))
                {
                    escapeBinary(buffer, c);
                }
                else
                {
                    buffer.append(c);
                }
            }
        }

        return buffer.toString();
    }
*/
}
