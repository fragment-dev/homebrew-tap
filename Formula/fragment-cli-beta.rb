require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3304.0.0-darwin-x64.tar.gz"
    sha256 "4d759707a2f9c0e7126af258672bda7d78189d3a865529f1f90b4274ef8b7a6a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3304.0.0-darwin-arm64.tar.gz"
      sha256 "6edda43fcc3550df469c2f6896e863ef3d1123a8df89a2b4ba2d08e6a04639a8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3304.0.0-linux-x64.tar.gz"
    sha256 "177a4deaf505f75059e5b8e869e181bf692ff2a692c2516a56481166aff2c549"
  end
  version "3304.0.0"
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
