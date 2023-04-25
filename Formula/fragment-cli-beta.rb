require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2521.0.0-darwin-x64.tar.gz"
    sha256 "e231179f4cf599c793f27e09ab1ef8a9d05f7a58b7c46809f003164101c51120"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2521.0.0-darwin-arm64.tar.gz"
      sha256 "83769396149463036006f03842346f1f91874a3fb23ec2d3ec3369aa3a552806"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2521.0.0-linux-x64.tar.gz"
    sha256 "8861eca53cebf6219c1cc73f73ad730ac9e3270d0b5c9f9f18e25483fc079ecc"
  end
  version "2521.0.0"
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
