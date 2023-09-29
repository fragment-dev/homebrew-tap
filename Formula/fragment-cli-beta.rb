require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3707.0.0-darwin-x64.tar.gz"
    sha256 "a8da43a9a7c2e2bae2841859e841ed353e1fce5b0b6f036cea85db8d27aa5da2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3707.0.0-darwin-arm64.tar.gz"
      sha256 "0fdad676973ff362e9341eda330e6f276417b7d5d339e2c07d8f77326ac0edf5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3707.0.0-linux-x64.tar.gz"
    sha256 "a549d264d9e28f4c47eef8b1894f31e1f0ccc07e3043c86d34e61e95c9117a19"
  end
  version "3707.0.0"
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
