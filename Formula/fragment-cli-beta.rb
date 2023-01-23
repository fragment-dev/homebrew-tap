require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1802.0.0-darwin-arm64.tar.gz"
    sha256 "c4dd28a1dfd8f7639ec3902b2a904b9c4a12394f7692c3f954705bc10de64d00"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1802.0.0-darwin-arm64.tar.gz"
      sha256 "a6d923bdd3a23a40e0811bea29dcf0b62f018c6768fc29d9acb969a7974441d2"
    end
  end
  version "1802.0.0"
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
