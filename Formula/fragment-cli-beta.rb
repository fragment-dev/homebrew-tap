require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4363.0.0-darwin-x64.tar.gz"
    sha256 "cb86a121ed557b42eb0a8529c6bf811766f60644282270dc7ed033f51bce43d0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4363.0.0-darwin-arm64.tar.gz"
      sha256 "090bfedfdb9f537eca9eb43be0ce9e451b920a105710a655c18dcd771eac6494"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4363.0.0-linux-x64.tar.gz"
    sha256 "c5e28428a9eaf7412b9492ed414ded4056820904463edcfee438210b839d5dac"
  end
  version "4363.0.0"
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
