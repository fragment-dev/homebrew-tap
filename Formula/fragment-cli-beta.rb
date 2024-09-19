require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5606.0.0-darwin-x64.tar.gz"
    sha256 "39b2255b24fa61e8611ef5a090a2330bf97e720ce6ae2918793a62529e4311dc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5606.0.0-darwin-arm64.tar.gz"
      sha256 "5e40b36488193deffc6f094793b0f0df3daed6f7be6addca637d0d5b5b959a73"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5606.0.0-linux-x64.tar.gz"
    sha256 "3cee0ac8ad615b0603f0bd3ec7751c41a90e6bf54fd9fabe12f5f02c1d46e8b8"
  end
  version "5606.0.0"
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
