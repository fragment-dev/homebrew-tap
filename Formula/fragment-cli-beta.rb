require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-darwin-x64.tar.gz"
    sha256 "acc95f00a50497bdc1bab313f2c0a1d014a630c94b09348521265d8098d17fd9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-darwin-arm64.tar.gz"
      sha256 "744b67d8dc8186239c066d9bec567c312a2061e39395d3e7e43daf5e3f4d8068"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-linux-x64.tar.gz"
    sha256 "dec6d89546addc2396761fbc64f20d051581e41856962b86d5f887c5daa02e0b"
  end
  version "1.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
