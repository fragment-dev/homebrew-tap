require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3912.0.0-darwin-x64.tar.gz"
    sha256 "b0c38665b84156eb270c0e70c68cefd6d5f54db061c273642c62d099e52ca592"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3912.0.0-darwin-arm64.tar.gz"
      sha256 "f69fc721d2dc31bb7b5bcbc8dcc830c704e3b5cfcbd9bb3263e067d61e02eab1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3912.0.0-linux-x64.tar.gz"
    sha256 "9b418b896b22c929383b749c56dd80f71f78047bcbc972fad7a2d53154a5e750"
  end
  version "3912.0.0"
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
