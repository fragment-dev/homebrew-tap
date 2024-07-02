require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5337.0.0-darwin-x64.tar.gz"
    sha256 "935cb70d3890a4427d32bb64f07d4365b97e9ae04a28475e197a983fd820dbc3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5337.0.0-darwin-arm64.tar.gz"
      sha256 "ade74d45bb54b8496421ea786618905996effeeb9cb1b8f29598dc8ef5d77cf1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5337.0.0-linux-x64.tar.gz"
    sha256 "00c7e229170c7e68ee5468aa6ae9db39b0de6196bae8199c7a9b24111fcd9cc6"
  end
  version "5337.0.0"
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
