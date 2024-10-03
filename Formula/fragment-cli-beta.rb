require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5642.0.0-darwin-x64.tar.gz"
    sha256 "898cc4d86000180f0821779475e5e8615449003839d94df1a1a3ef20d903349f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5642.0.0-darwin-arm64.tar.gz"
      sha256 "9f980ee9a5ae660841d55e33a72795c7aa7f01d063c346dec4522d7e9e18f160"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5642.0.0-linux-x64.tar.gz"
    sha256 "4736fc78665dcfa6d7affe750d058267bb576fbf56a65fea7ab7fbdd344d02e9"
  end
  version "5642.0.0"
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
