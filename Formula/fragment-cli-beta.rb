require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2732.0.0-darwin-x64.tar.gz"
    sha256 "b40b1d3e5e2824411e762959a77d8658ce7a653c998823e97a7b3efa845bb813"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2732.0.0-darwin-arm64.tar.gz"
      sha256 "6140b61fdf07e11b168591595518a7d97f1755d9efa710eb0fe3dbe9d28132f0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2732.0.0-linux-x64.tar.gz"
    sha256 "df96fa5b08aa9265544a509c0ebc141614213b95ed431db73d05f5c258ebb27b"
  end
  version "2732.0.0"
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
