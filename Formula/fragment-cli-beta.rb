require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4897.0.0-darwin-x64.tar.gz"
    sha256 "0cf6bf8a05369b2c27e10dc55bb708f21689bf0436e0b23a8732d82363edbc1d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4897.0.0-darwin-arm64.tar.gz"
      sha256 "810f4dc968d7b31d142470411f95def5bd9891617a62705e2ccbe442c99cf636"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4897.0.0-linux-x64.tar.gz"
    sha256 "9f4c2281bad0ae65bd6fd69b6d3ba9820b4ac0b5e8eac1f8c8938c45eae1b339"
  end
  version "4897.0.0"
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
