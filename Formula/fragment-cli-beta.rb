require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5035.0.0-darwin-x64.tar.gz"
    sha256 "d8dcdd4097a7012e054a02e48c56afc62b93c52c7f0a70d3a02b7254f17bb5be"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5035.0.0-darwin-arm64.tar.gz"
      sha256 "7065ed385fb6fee95f9d976e6e10e63915476a8c1f617529a32d1027897b165a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5035.0.0-linux-x64.tar.gz"
    sha256 "61b9c538fc98ade12d85ee7b60270b490cc4265f704abe339b07dea4e2b8643a"
  end
  version "5035.0.0"
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
