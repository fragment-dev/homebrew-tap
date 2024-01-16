require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4343.0.0-darwin-x64.tar.gz"
    sha256 "e02d8dea6f744bb19c6616aec0ba92209a687aab88fb9116f8e069131afbce2b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4343.0.0-darwin-arm64.tar.gz"
      sha256 "1e4930c3079aca46ace7feebaa87bad18797b10497c0487852c80b445153eea8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4343.0.0-linux-x64.tar.gz"
    sha256 "03bd8091707882bf6028931a9b4828ccf967f9753c7cba876710b328171f8593"
  end
  version "4343.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
