require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4627.0.0-darwin-x64.tar.gz"
    sha256 "bce41020c8067179826a6056f5143e600fcb25da0658500b4609926a3abd0de5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4627.0.0-darwin-arm64.tar.gz"
      sha256 "377d2bcf9c86d0e838a3a853b5bc220f30eb99a03d11252cec09896db69cc87a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4627.0.0-linux-x64.tar.gz"
    sha256 "34e472bd764995400e150bd69007704e50529ba93a0df24d6fea5952298c4406"
  end
  version "4627.0.0"
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
