require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5418.0.0-darwin-x64.tar.gz"
    sha256 "f48f7c2bbe3d30a50b52b9ae5dc0dfd95247c90b251ae8c96d9db1e83d525217"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5418.0.0-darwin-arm64.tar.gz"
      sha256 "68c212c0ec51603986ae5d27b2aea4c0abc361377b81ba3d1f8fb7d64a995f8b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5418.0.0-linux-x64.tar.gz"
    sha256 "ed03e0d726351cea68cddabfeab0b6c361234d4c0daac5185aeb26ad0eeb3bc5"
  end
  version "5418.0.0"
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
