require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3996.0.0-darwin-x64.tar.gz"
    sha256 "d968dbd62931ef71cd919a26d9d62dbd72a6f0d9ab29fc7bc4af890203847754"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3996.0.0-darwin-arm64.tar.gz"
      sha256 "5b5a54e471f18be0beb19fc6ef91787bea9d1e0374265db9640e920f1889af19"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3996.0.0-linux-x64.tar.gz"
    sha256 "645399ef0fb59fca02f2d13c63da66dccd285f269ee9eee6e1cc86556261fcd6"
  end
  version "3996.0.0"
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
