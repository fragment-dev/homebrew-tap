require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3208.0.0-darwin-x64.tar.gz"
    sha256 "910e5e5da78b13336dc47e53717fecb6994ab6b1739c1ec49154e6179277b8a7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3208.0.0-darwin-arm64.tar.gz"
      sha256 "16f87627b7ad2b3bb300a5a46693a3f98cc43489f30457a2ec78c1af42119426"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3208.0.0-linux-x64.tar.gz"
    sha256 "7a2038ff750437b3e4f54cce77c9460ee3e3e61c4e7dbcb83e0cc2917ef81062"
  end
  version "3208.0.0"
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
