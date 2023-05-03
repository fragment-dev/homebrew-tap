require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2573.0.0-darwin-x64.tar.gz"
    sha256 "0ec509a91b7c090f6ec9515858a33fe5cdf958dfda3eb1d8bf29dc54ce22a78a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2573.0.0-darwin-arm64.tar.gz"
      sha256 "dd14b22f02a887d1280f0f62a30c9654a08ac37a28a6b89778d50b1fd1e9b08d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2573.0.0-linux-x64.tar.gz"
    sha256 "17e77b440da35afb0318b1b499a2a06044b48558c7f5215e6ebeb5630abed700"
  end
  version "2573.0.0"
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
