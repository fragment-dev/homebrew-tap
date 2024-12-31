require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6012.0.0-darwin-x64.tar.gz"
    sha256 "172ca374ea61a1d17ca5e49506fcebacfd2d7bb6f5497f5cfebd89b5a0d91285"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6012.0.0-darwin-arm64.tar.gz"
      sha256 "757b64f8052242f08db85657f448de3347a611047ac7a65c807a8732cf317d56"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6012.0.0-linux-x64.tar.gz"
    sha256 "0662ec57a6900f7916f8df8f3311639706b816289b3aea2ef63aea03b6def0b5"
  end
  version "6012.0.0"
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
