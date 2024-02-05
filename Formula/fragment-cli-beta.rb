require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4495.0.0-darwin-x64.tar.gz"
    sha256 "26e3ed17054106a2f947b3ad7818bfaad440e50dccffe3184f8b357b5bc3bd01"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4495.0.0-darwin-arm64.tar.gz"
      sha256 "b72df56668a9fd3da16c55d61fc0aefffbda42316ee8c57751da2bf53507efdb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4495.0.0-linux-x64.tar.gz"
    sha256 "000f4c8e5af3acb4b6a430c5a91b8cdabac8db022745c20cd385ab40b8346c91"
  end
  version "4495.0.0"
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
