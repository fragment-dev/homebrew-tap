require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4079.0.0-darwin-x64.tar.gz"
    sha256 "514a19c186e831ae7eacee36fdbd4f211b585437ee93eee021b349667b592b9c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4079.0.0-darwin-arm64.tar.gz"
      sha256 "8f5f1a15610c04e8aed2a2ae3e839f9b572e596beefdedfca021ecaa086503ae"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4079.0.0-linux-x64.tar.gz"
    sha256 "a7891fb02bf6b69cc4b807cec87b1074ec47bc546539d5c287d76c52d6f7ac07"
  end
  version "4079.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
