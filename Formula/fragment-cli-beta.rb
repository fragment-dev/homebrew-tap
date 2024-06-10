require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5252.0.0-darwin-x64.tar.gz"
    sha256 "867348ea451aca81aaa7341fd34e1dc6e548ca0feaf9531a01581960c5c89d58"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5252.0.0-darwin-arm64.tar.gz"
      sha256 "5b99709d065499fbce5e93a1230fd39519e9ce568c7ff01e96f5344a548e6133"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5252.0.0-linux-x64.tar.gz"
    sha256 "6c0fac896c3e02bd38c752ad8d5a7c9ecf40cab4163c471652fcaada0b02f002"
  end
  version "5252.0.0"
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
