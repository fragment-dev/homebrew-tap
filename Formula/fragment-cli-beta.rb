require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2633.0.0-darwin-x64.tar.gz"
    sha256 "e3631283f33678beebd38106640103e7128da7938769904af9c3227be5af0af1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2633.0.0-darwin-arm64.tar.gz"
      sha256 "bcda10a2890dc0febc568e3169a037c5a9c5ec890bc553c230c575a9153c192c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2633.0.0-linux-x64.tar.gz"
    sha256 "49a024f34bd0b6fe146ec938d53e318616a603d428ad4c5abac84a2a3ee702cb"
  end
  version "2633.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
