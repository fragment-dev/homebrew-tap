require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3722.0.0-darwin-x64.tar.gz"
    sha256 "deb494b1ad3a901d49fa5c487be83a6d1031b48b4b2a2125d7a299b975dac30f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3722.0.0-darwin-arm64.tar.gz"
      sha256 "8fef5a67b1e3763558b4eabf867525c8e0ba693bc128ea9607738ac7dd64cbd8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3722.0.0-linux-x64.tar.gz"
    sha256 "d9bb61804aa21007bd7518daab3d8112a7b6b66cc6a5fa0e67bc8acdba08195e"
  end
  version "3722.0.0"
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
