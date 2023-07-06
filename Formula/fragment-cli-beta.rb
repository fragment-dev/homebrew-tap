require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3016.0.0-darwin-x64.tar.gz"
    sha256 "81f47fe9b5f86d1ebb3d70edfb9384c24fa54e1fd993b40b823ede332c2e1ee5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3016.0.0-darwin-arm64.tar.gz"
      sha256 "cd17fda16cd723325480d61a5b7a42525f8412b77625ae18ff76708977af41f9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3016.0.0-linux-x64.tar.gz"
    sha256 "74ad518182d495580153a4a3db404b64f68cdf16d49a9647ab6516550804a779"
  end
  version "3016.0.0"
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
