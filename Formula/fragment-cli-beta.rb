require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5646.0.0-darwin-x64.tar.gz"
    sha256 "306931a8fdca9bcb38de54838781918bf3a92898c124e93bdad8cce263c30d20"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5646.0.0-darwin-arm64.tar.gz"
      sha256 "f3de9c2fec339c6badf6671a66ba80dfb5539e5d7ace61a852c2804200525631"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5646.0.0-linux-x64.tar.gz"
    sha256 "a3b0eea765189897b60900637afcc666745c0b1674fbb5bc4588ca5cf8f16ad5"
  end
  version "5646.0.0"
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
