require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4284.0.0-darwin-x64.tar.gz"
    sha256 "2d69429fa14bd5f0a093dc3a18cebdb7d83ff99f871b26107e9e822cc4d217ad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4284.0.0-darwin-arm64.tar.gz"
      sha256 "00bc7811ffae6983ae09c6c4491bf39951ee59adb7600b5ed540ccea5d2b4142"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4284.0.0-linux-x64.tar.gz"
    sha256 "4f641a4992f0cc33903d7f0dade82aab15c2ec306abb3ee827d75ad940703d15"
  end
  version "4284.0.0"
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
