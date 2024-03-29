require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4821.0.0-darwin-x64.tar.gz"
    sha256 "c4955ce33f9a9d378ab1bedf22b7fe2afca0094e174f2992a830f5ae46a37dd4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4821.0.0-darwin-arm64.tar.gz"
      sha256 "90a44663c5d33dfd857f1ad3206f936257d832c552f8790628f83ddf2f7d1747"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4821.0.0-linux-x64.tar.gz"
    sha256 "9ecabeae334a77793daa149cbc7af507d56a999c803b63042b192017dae4a25a"
  end
  version "4821.0.0"
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
