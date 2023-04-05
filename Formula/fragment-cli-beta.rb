require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2360.0.0-darwin-x64.tar.gz"
    sha256 "5db32d022e2268db82b60101635b67ae53952cccadcc92f45a33ceedb2b18ec2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2360.0.0-darwin-arm64.tar.gz"
      sha256 "1fbcd3356ed4b2c5930717165f057f46371ab3d82089b730dc0dc94f4b64d729"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2360.0.0-linux-x64.tar.gz"
    sha256 "7d56dc26f226582287dbb6439ed2398363d7956f33f601c0540fd54d8d997006"
  end
  version "2360.0.0"
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
