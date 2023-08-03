require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3232.0.0-darwin-x64.tar.gz"
    sha256 "77318f58eb96cf858586cb015eb2d9d1d7ed1fcdbf3eac5605c04d9389c95e58"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3232.0.0-darwin-arm64.tar.gz"
      sha256 "30b2edb5a42d365b1a364c2cf65753225632300ad5407bdf72f5c8a0b654f48f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3232.0.0-linux-x64.tar.gz"
    sha256 "73adc7778624f1527c5226d73431bf07be0ee3bb06d5e7ebccd02d2fb3a12850"
  end
  version "3232.0.0"
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
