require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6084.0.0-darwin-x64.tar.gz"
    sha256 "8baed80e6000754915ab2a5dbc0dd95760803ca17373b309ea6dc8ca2ab0962d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6084.0.0-darwin-arm64.tar.gz"
      sha256 "bdcbca49feca5d5f50cf7928435268d75ecd66f28c55087b93bb644393aacdf0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6084.0.0-linux-x64.tar.gz"
    sha256 "62703a899b3a619d2a974041cc9cd48d711d83b2b3412f3ff46bd88ecd146348"
  end
  version "6084.0.0"
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
