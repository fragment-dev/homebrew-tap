require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4308.0.0-darwin-x64.tar.gz"
    sha256 "1df6e13ecc600f960959e73e65355452080cbd3e44f35bdd53e0743849799cbd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4308.0.0-darwin-arm64.tar.gz"
      sha256 "26da2c1427021b82c53210a0209dfa95f99d2e5130ebb6f5efb263543c1ef049"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4308.0.0-linux-x64.tar.gz"
    sha256 "e25fabaab3f6d53ee2bd6c438ce3cb509ad9c06065073da636851124c962c312"
  end
  version "4308.0.0"
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
