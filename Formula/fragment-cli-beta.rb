require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5969.0.0-darwin-x64.tar.gz"
    sha256 "154beabf3be945fb35d5fb010549a9b832a878abbb09cd72e2ec9d52b379dc5d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5969.0.0-darwin-arm64.tar.gz"
      sha256 "50a3342f05f5fdc7ae86bd94efe15eb9a5c105c423a6a9d39bb74363c929dcf0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5969.0.0-linux-x64.tar.gz"
    sha256 "b3c81da18c601654b8c4ae9c40a222ec2ed5ba514378f7214577d01faa199957"
  end
  version "5969.0.0"
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
