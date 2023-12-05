require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4085.0.0-darwin-x64.tar.gz"
    sha256 "07c8732f2a5752f216f4060025b97ce5306f8f3fce22cb3e7fb01f2d9b88df42"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4085.0.0-darwin-arm64.tar.gz"
      sha256 "d22d815d73f43ee6430bc247d82691ff9a2f95d7bec409efa4dc18e156078466"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4085.0.0-linux-x64.tar.gz"
    sha256 "577f78d960fe3ead61280196e5baa8488b9a9acfc4a09854069bccc0f00ad45f"
  end
  version "4085.0.0"
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
