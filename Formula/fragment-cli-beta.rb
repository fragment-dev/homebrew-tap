require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4109.0.0-darwin-x64.tar.gz"
    sha256 "644fd710801faa134ddf7056a74517c01628828e4146d648ea66c01f92f01c92"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4109.0.0-darwin-arm64.tar.gz"
      sha256 "8f490f530ec48bcbf9fce9a608d0900b2bdfbedc1890160629957ceb57d74c3a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4109.0.0-linux-x64.tar.gz"
    sha256 "44c9ee0f34078c1f2c6ebd11ab23ae043a457f111e16ba88c3242034e9a9fdc9"
  end
  version "4109.0.0"
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
