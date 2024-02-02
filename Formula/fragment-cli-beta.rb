require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4488.0.0-darwin-x64.tar.gz"
    sha256 "f4e2fc1c888e751a5d11d78a24c8afead8cfb7cc909207677e73e843789fd14c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4488.0.0-darwin-arm64.tar.gz"
      sha256 "1b709629466ad301b8afafb841000ff7b52fab2ec0661aa97059e902ee317cc6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4488.0.0-linux-x64.tar.gz"
    sha256 "0cdc5d285cb91e1016103ce3ebecef285efbf45fe67a5ef9f1a66eb02da0d45a"
  end
  version "4488.0.0"
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
