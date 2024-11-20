require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.19-1-darwin-x64.tar.gz"
    sha256 "80930cff801f794238715b9c9cdfe9ac856dad72396830c0f62069a53b541e7d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.19-1-darwin-arm64.tar.gz"
      sha256 "5acd93e20fac67c87065d5667e36d4d5cfaa57131a32e92a4bfb7d015b19984d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.19-1-linux-x64.tar.gz"
    sha256 "0bbe4ac8f93bcb5b76da6eafea8213d7fa29d177e6e51209ca7c2304504dfe0d"
  end
  version "2024.11.19-1"
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
