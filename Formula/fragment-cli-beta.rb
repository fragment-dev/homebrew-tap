require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3580.0.0-darwin-x64.tar.gz"
    sha256 "02e6ccaa4705fa741b1248661710497e319a1cc74777f4c5d1ec6c11a2de11c8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3580.0.0-darwin-arm64.tar.gz"
      sha256 "aed906ba00a6ca54753c264d79f1603c5a9c1816d81ae0f40843177831770139"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3580.0.0-linux-x64.tar.gz"
    sha256 "38fd56567e558923d46b043d6c95b8f07a71d6996e1ac63b6e7cb91aa2bb67a8"
  end
  version "3580.0.0"
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
