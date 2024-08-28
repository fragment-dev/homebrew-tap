require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5550.0.0-darwin-x64.tar.gz"
    sha256 "976f5935fb754c7b2bc7bc2a54f06ae5d37d65670c878dc88b99956894b8e214"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5550.0.0-darwin-arm64.tar.gz"
      sha256 "23650d5edbb5b75b0d71e3464afd8cfaec2d541eef85a3e9abec5f82e4691303"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5550.0.0-linux-x64.tar.gz"
    sha256 "e4bc0ee728a05f5b2e2f1b4c1fbffb1ddce87d6e5909027274e068b4b71c22de"
  end
  version "5550.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
