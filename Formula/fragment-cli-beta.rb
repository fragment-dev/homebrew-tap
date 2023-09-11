require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3517.0.0-darwin-x64.tar.gz"
    sha256 "a0e5a53ee5eeee7d8431df6a661f8b38d8dee862a54a22dab36dc87911e2de8b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3517.0.0-darwin-arm64.tar.gz"
      sha256 "907cae7d9c8bd28e2965e092d4d6c8d66be89a9a7ccae24dbeb61d2f126e7894"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3517.0.0-linux-x64.tar.gz"
    sha256 "0be8b7912d8530278853f9313743f5c93ace295b51d13479c57531918a087030"
  end
  version "3517.0.0"
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
