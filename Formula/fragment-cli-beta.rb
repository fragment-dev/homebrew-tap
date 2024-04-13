require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4894.0.0-darwin-x64.tar.gz"
    sha256 "924bfe14fd98c823a05b1b99f534f89c8c3377f61ee7bcc2b851d8b5dda00d35"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4894.0.0-darwin-arm64.tar.gz"
      sha256 "eac5ca91cba76cd901c509ce68aa1203ce751895727c42a0d700ed082dd09760"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4894.0.0-linux-x64.tar.gz"
    sha256 "baff9cc6141d6ab191549d7ceadf882dff775b57fc7d2754e6e50d5f77f9ca89"
  end
  version "4894.0.0"
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
