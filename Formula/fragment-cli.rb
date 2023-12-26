require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.25-darwin-x64.tar.gz"
    sha256 "8e1bc53ae87d93c8d5a12ff22be54e50548864bc64444e18b7577fe14d928b54"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.25-darwin-arm64.tar.gz"
      sha256 "87248a04d39fbf1f996c1f55c221f32602cb29a8e50882f91207620664fa4de6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.25-linux-x64.tar.gz"
    sha256 "d90ddee35bedafb029f5774a1f659093f63d1a38525485b33bfb73c4ca44540e"
  end
  version "2023.12.25"
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
