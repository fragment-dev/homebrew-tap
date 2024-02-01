require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4481.0.0-darwin-x64.tar.gz"
    sha256 "11c3ac6d92970836ac42e7511e000349c8879f51fd13b5a398314800d1168419"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4481.0.0-darwin-arm64.tar.gz"
      sha256 "973d50ea9a6f4cccd47435ce3b71255035562d7391c06c28506b029dae90c2a7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4481.0.0-linux-x64.tar.gz"
    sha256 "477bd977d5fe71fd7c9daef462971e1d4e28399955f24bfedab2e3ffb6394523"
  end
  version "4481.0.0"
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
