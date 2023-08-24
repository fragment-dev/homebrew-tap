require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3378.0.0-darwin-x64.tar.gz"
    sha256 "60a194e7f94d44682689c338c83cea836c0f0525366363bde678aaced36c645f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3378.0.0-darwin-arm64.tar.gz"
      sha256 "dcbd4369fcd85ba6ac780019ea8dbc769ebc24aa5ce6779f70a4fc014c290569"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3378.0.0-linux-x64.tar.gz"
    sha256 "03d049894635d5bf2b00fdd612d8932f1b57097b81f5ebc5420f3486856858eb"
  end
  version "3378.0.0"
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
