require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2429.0.0-darwin-x64.tar.gz"
    sha256 "43cac967c8e44d7943aea44c2f7faf6ce8d75c5dfec69375ffb507a91b934665"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2429.0.0-darwin-arm64.tar.gz"
      sha256 "ed0e615f3925660ec923726750606b09193ab0f08f9177ef26dea19cd76350c3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2429.0.0-linux-x64.tar.gz"
    sha256 "e828b94a41949bbbbeeaafe4ceeeeb81746058bfd3ec461d90381273994ee8fa"
  end
  version "2429.0.0"
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
