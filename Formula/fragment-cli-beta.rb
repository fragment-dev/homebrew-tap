require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4895.0.0-darwin-x64.tar.gz"
    sha256 "f11a1fe7f184bf8c77b1d05a3faa824d1c4bee05235354d950af84ff57435b02"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4895.0.0-darwin-arm64.tar.gz"
      sha256 "b6fceca03b2467f2afb3de77cab253e9645ed89b5246bd34a8e469fb32132d60"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4895.0.0-linux-x64.tar.gz"
    sha256 "8b13ea376cd7d6f020a3cd2e8ba13598b97ca99c5219a6d2eebc9fd9453135a1"
  end
  version "4895.0.0"
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
