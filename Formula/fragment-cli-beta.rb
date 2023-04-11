require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2408.0.0-darwin-x64.tar.gz"
    sha256 "a53f97f91d7aa8ddd719a0fefef5a9cf62eb7884b8fb654dc500b96e8cf5a012"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2408.0.0-darwin-arm64.tar.gz"
      sha256 "e4d72e1b89db8ee3233e6f6507b4b912c23238c9a8a231299ccf19574b603905"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2408.0.0-linux-x64.tar.gz"
    sha256 "f42d2093022386bf7acf33fed86bd31700ab382ad31f7d56c1afbbc913798ba5"
  end
  version "2408.0.0"
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
