require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4657.0.0-darwin-x64.tar.gz"
    sha256 "3956bb4abd5f6882852e1afcd9274b53d4f31acc7e4083be5c66227ef762f120"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4657.0.0-darwin-arm64.tar.gz"
      sha256 "b9c19265a23b5e98c488b17b5efe1bbb4fe909e8add5a3239fb4be53752dffce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4657.0.0-linux-x64.tar.gz"
    sha256 "7a6365400fcfea60a5c94aa99542686d44f30a6672c8dffdc2dc17e8ba99da9f"
  end
  version "4657.0.0"
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
