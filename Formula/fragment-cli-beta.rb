require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4518.0.0-darwin-x64.tar.gz"
    sha256 "ea48da77feaa632d4fcb989ca8f91b3b35c349dce79e3f13c7412452d63ce033"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4518.0.0-darwin-arm64.tar.gz"
      sha256 "c88c38c47c2df5d82605907f27bfda597da35f0c661a180c78b7bc25a36d403e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4518.0.0-linux-x64.tar.gz"
    sha256 "463afb02c1315a9abe6d166b3472569340cc104066dc4102f0f7909bb8186b11"
  end
  version "4518.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
