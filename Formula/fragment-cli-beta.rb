require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3698.0.0-darwin-x64.tar.gz"
    sha256 "e04aa08fb32d567c47eda1139ee2e4b55021c1f0d1def9e32e2b03b9e8a185ed"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3698.0.0-darwin-arm64.tar.gz"
      sha256 "56a60c967d923626bbae8f2845731e46c1a76c703d1ed52939f96b577286a8d4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3698.0.0-linux-x64.tar.gz"
    sha256 "71a22c060c9ebc63309f797fdadfe0a14eab220bfe0b1a4581c3c4336ff219fc"
  end
  version "3698.0.0"
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
