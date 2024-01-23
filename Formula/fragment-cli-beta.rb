require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4412.0.0-darwin-x64.tar.gz"
    sha256 "833b826c65d4ba01bb4191f945f8398c6f3912a7f508b89a61741ab92a28f729"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4412.0.0-darwin-arm64.tar.gz"
      sha256 "7190b6404ad7194a9fd00fca2f96023c9d39ee235469e288df365e688c4de8dc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4412.0.0-linux-x64.tar.gz"
    sha256 "791b844622c7eed6158f2c233963ab3151e0b6a09427f184e5ad13d953bf692a"
  end
  version "4412.0.0"
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
