package com.veta.filters;

import javax.servlet.*;
import java.io.IOException;

public class EncodingFilter implements Filter {

    private String encoding = "UTF-8";

    @Override
    public void init(FilterConfig config) {
        String enc = config.getInitParameter("encoding");
        if (enc != null && !enc.isEmpty()) this.encoding = enc;
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        if (req.getCharacterEncoding() == null)
            req.setCharacterEncoding(encoding);

        res.setCharacterEncoding(encoding);

        chain.doFilter(req, res);
    }

    @Override
    public void destroy() {
        // hakuna kitu cha kufanya hapa
    }
}